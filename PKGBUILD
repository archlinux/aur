# Maintainer: Proudmuslim <proudmuslim-dev@protonmail.com>
# Previous Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone-bin
_pkgname=dangerzone
pkgver=0.11.0
pkgrel=2
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://github.com/freedomofpress/dangerzone"
arch=('x86_64')
license=('AGPL-3.0')
depends=('python-appdirs' 'python-markdown' 'python-click' 'python-colorama' 'python-pyxdg' 'python-requests' 'pyside6' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools')
options=('!debug')
source=("${_pkgname}-${pkgver}.deb::https://packages.freedom.press/apt-tools-prod/pool/main/d/dangerzone/dangerzone_${pkgver}_amd64.deb")
sha256sums=('f10c085ef4ee6743739adcf077da65dde84ac5be84b5aadb2e7ea98510f1be85')
pythonpath="#!/usr/bin/env python3"

package() {
  # Create directories in advance
  install -d "${pkgdir}/usr/"
  install -d "${pkgdir}/usr/lib/python3.14/site-packages/"

  # Extract data
  ar x "${_pkgname}-${pkgver}.deb"
  tar xf data.tar.xz 

  cp -r "${srcdir}/usr" "${pkgdir}/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone" "${pkgdir}/usr/lib/python3.14/site-packages/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone-${pkgver}.egg-info" "${pkgdir}/usr/lib/python3.14/site-packages/"

  # Remove unused directory
  rm -r "${pkgdir}/usr/lib/python3"
}

