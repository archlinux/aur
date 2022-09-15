# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=amalthea-gdc
pkgver=1.2.1
pkgrel=1
pkgdesc="Small general library for the D programming language, version for GDC"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('Boost or LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2')
depends=('gcc-d')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('e002fb21e8b2595bcd867eb6a9c5c2603633ca0403433b6aea0b3ea2b581fe67')

build() {
    cd "amalthea-v$pkgver"
    make || return 1
}

package() {
    GDC_VERSION=`gdc -dumpversion`
    INCDIR=lib/gcc/x86_64-pc-linux-gnu/${GDC_VERSION}/include/d/
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir INCDIR=${INCDIR} install || return 1
}

