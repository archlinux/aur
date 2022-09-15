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
sha256sums=('f9ec27a8859a10605e51a6b6f4096c57a59e759a293c57aca73e9076b2941ae6')

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

