# @file PKGBUILD 
# @brief The package script
# @author Erick Carrillo.
# @copyright Copyright (C) 2023, Erick Alejandro Carrillo López, All right reserved.
# @license This project is released under the MIT License 

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>

# Move to the build directory
pkgname=unittest-c
pkgver=1.1.1
pkgrel=3
epoch=
pkgdesc="unittest c is a fast and simple macro-based unit testing framework for C.
It's inspired by the Python unittest module and designed to reduce boilerplate code.
With macros and a built-in test runner, it's ideal for large test suites."
arch=('x86_64')
url="https://github.com/alecksandr26/unittest-c/archive/refs/tags/v1.1.0.tar.gz"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils trycatch-c)
optdepends=(valgrind)
source=("$pkgname-$pkgver.tar.gz::$url")
md5sums=('SKIP')
basedir=$(pwd)

# Compile the source code 
build() {
    tar -xf "$basedir/$pkgname-$pkgver.tar.gz"
    cd $srcdir/$pkgname-$pkgver
    make compile		# Compile the unittest library
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $srcdir/$pkgname-$pkgver
    # Create the folders
    mkdir -p $pkgdir/usr
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/usr/lib
    
    # Install into the package the program
    cp -r $srcdir/$pkgname-$pkgver/include/* $pkgdir/usr/include
    cp -r $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib
}
