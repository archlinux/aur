# Maintainer: Michael DeGuzis  <mdeguzis@gmail.com>

pkgname=ssgl-doom-launcher-git 
pkgver=v1.1.1.r1.gfb54314 
pkgrel=1 
pkgdesc="Doom Frontend with Oblige mapbuild integration for zdoom, gzDoom, Zandronum, Doom64EX and DoomRPG written in AngularMaterial on NWJS for Windows, Linux and OSX." 
arch=('x86_64' 'i686') 
url="https://github.com/FreaKzero/ssgl-doom-launcher" 
license=('GPL2')
makedepends=('bower' 'git' 'grunt-cli')
source=('ssgl-doom-launcher-git::git+https://github.com/FreaKzero/ssgl-doom-launcher.git')
md5sums=('SKIP')

pkgver() {

  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {

  cd "$pkgname"
  bower install
  grunt build-linux

}

package() {

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications

  cd "$srcdir/$pkgname"
  install -m644 "build/SSGL/linux64/SSGL" "$pkgdir/usr/bin/ssgl"

}
