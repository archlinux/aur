#!/bin/bash

#Maintainer: Davi Seidel Brandão github.com/Dannan21 daviseidel.brandao@gmail.com

pkgname=garu
pkgver=1.0
pkgrel=1.0
pkgdesc="Garu Assists Repository Users. Yet anothe AUR helper"
url="https://github.com/Dannan21/garu"
arch=("x86_64")
license=("MIT")
depends=("go-task" "git")
makedepends=("go")
#source=("https://github.com/Dannan21/garu/archive/refs/tags/release.tar.gz")
pkgdir="$srcdir/garu"


build() {
  export srcdir=.
  rm -rf /tmp/$pkgname-*
  # Clone the Git repository
  git clone "$url" "$srcdir/$pkgname"
  
  # Build the project using go-task
  cd "$srcdir/$pkgname"
  go-task build
}

package() {
  # Install the binaries
  cd "$srcdir/$pkgname"
  #sudo echo $pkgdir
  sudo install -Dm755 -t "$pkgdir/usr/bin" bin/*
  
  # Install license and documentation
  sudo install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Run the prepare, build, and package functions
build
package
