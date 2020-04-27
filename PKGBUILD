# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python2-matplotlib
pkgver=2.2.5
pkgrel=2
pkgdesc="A python plotting library, making publication quality plots"
arch=(x86_64)
url="https://matplotlib.org"
license=(custom)
depends=(freetype2 libpng python2-numpy python2-cycler python2-dateutil python2-kiwisolver python2-pyparsing python2-backports.functools_lru_cache)
optdepends=('tk: Tk{Agg,Cairo} backends'
            'python2-pyqt5: Qt5{Agg,Cairo} backends'
            'python2-gobject: for GTK3{Agg,Cairo} backend'
            'python2-wxpython: WX{,Agg,Cairo} backend'
            'python2-cairo: {GTK3,Qt5,Tk,WX}Cairo backends'
            'python2-cairocffi: alternative for Cairo backends'
            'python2-tornado: WebAgg backend'
            'ffmpeg: for saving movies'
            'imagemagick: for saving animated gifs'
            'python2-pillow: for reading/saving jpeg/bmp/tiff files'
            'ghostscript: usetex dependencies'
            'texlive-bin: usetex dependencies')
makedepends=(git rsync python2-setuptools
             tk python2-pyqt5 python2-gobject
             python2-wxpython python2-cairocffi python2-tornado
             python2-pillow ghostscript texlive-bin)
             # qhull missing pkg-config file
             # agg missing some non-upstreamed patches?
source=("https://github.com/matplotlib/matplotlib/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e2f7d46a3548a1c79ad6bbcce69e73223808b3066f7f63f893568d9d96f3167fd189af86927abcbc9fafe6b2f1477a1c8227e444d7118164f5af0f69df590d9f')

build() {
  cd matplotlib-${pkgver}
  
  python2 setup.py build
}

package() {
  cd matplotlib-${pkgver}
  
  python2 setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 doc/users/license.rst -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
