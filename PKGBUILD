# Maintainer: Proudmuslim <proudmuslim-dev@protonmail.com>
# Previous Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.5.1
pkgrel=3
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://github.com/freedomofpress/dangerzone"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-markdown' 'python-click' 'python-colorama' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools')

source=("${pkgname}-${pkgver}.deb::https://packages.freedom.press/apt-tools-prod/pool/main/d/dangerzone/dangerzone_${pkgver}-1_all.deb")

install=${pkgname}.install
sha256sums=('9e26708b1846328f670ae9aec1d35d1a9322cdce3c29cf2551d331d0cda31209')
pythonpath="#!/usr/bin/env python3"

package() {
  # Create directories in advance
  install -d "${pkgdir}/usr/"
  install -d "${pkgdir}/usr/lib/python3.11/site-packages/"

  # Extract data
  ar x "${pkgname}-${pkgver}.deb"
  tar xf data.tar.xz 

  cp -r "${srcdir}/usr" "${pkgdir}/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone" "${pkgdir}/usr/lib/python3.11/site-packages/"
  mv "${pkgdir}/usr/lib/python3/dist-packages/dangerzone-${pkgver}.egg-info" "${pkgdir}/usr/lib/python3.11/site-packages/"

  # Remove unused directory
  rm -r "${pkgdir}/usr/lib/python3"
}
