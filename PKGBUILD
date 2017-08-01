# Maintainer: Alex Garcia <thekyz@gmail.com>
pkgname=jobber
pkgver=1.2
pkgrel=1
epoch=
pkgdesc='jobber'
arch=('x86_64')
url='http://dshearer.github.io/jobber/'
license=('MIT')
md5sums=('3e0bae9c67ab2cda90474cf3068e0779')
install='.install'
source=("https://github.com/dshearer/jobber/releases/download/v$pkgver/$pkgname-$pkgver-1.el7.centos.$arch.rpm")

build() {
    cd $srcdir
    bsdtar -xf ../$pkgname-$pkgver-1.el7.centos.$arch.rpm
}

package() {
    mkdir -p $pkgdir/usr/bin

    sed -i '/^ExecStart=/s/\/usr\/local\/libexec\/jobberd/\/usr\/lib\/jobber\/jobberd/' $srcdir/usr/lib/systemd/system/jobber.service

    mv $srcdir/usr/lib $pkgdir/usr/lib
    mv $srcdir/usr/local/bin/jobber $pkgdir/usr/bin/
    mv $srcdir/usr/local/libexec/ $pkgdir/usr/lib/jobber
}

