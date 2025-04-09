# Maintainer: Proudmuslim <proudmuslim-dev@protonmail.com>
# Previous Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone-bin
_pkgname=dangerzone
pkgver=0.9.0
pkgrel=1
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://github.com/freedomofpress/dangerzone"
arch=('x86_64')
license=('AGPL-3.0')
depends=('python-appdirs' 'python-markdown' 'python-click' 'python-colorama' 'python-pyxdg' 'python-requests' 'pyside6' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools')
options=('!debug')
source=("${_pkgname}-${pkgver}.deb::https://packages.freedom.press/apt-tools-prod/pool/main/d/dangerzone/dangerzone_${pkgver}_amd64.deb")

install=${_pkgname}.install
sha256sums=('e99c776d22e76afd02d14ff2cc8151cb217ae0c5dfe541210d5f17de0e6bef42')
pythonpath="#!/usr/bin/env python3"

package() {
  # Create directories in advance
  install -d "${pkgdir}/usr/"
  install -d "${pkgdir}/usr/lib/python3.13/site-packages/"

  # Extract data
  ar x "${_pkgname}-${pkgver}.deb"
  tar xf data.tar.xz 

  cp -r "${srcdir}/usr" "${pkgdir}/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone" "${pkgdir}/usr/lib/python3.13/site-packages/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone-${pkgver}.egg-info" "${pkgdir}/usr/lib/python3.13/site-packages/"

  # Remove unused directory
  rm -r "${pkgdir}/usr/lib/python3"
}

