# Maintainer: Michael DeGuzis  <mdeguzis@gmail.com>

pkgname=ssgl-doom-launcher-git 
pkgver=v1.1.1.r1.gfb54314 
pkgrel=4
pkgdesc="Doom Frontend with Oblige mapbuild integration for zdoom, gzDoom, Zandronum, Doom64EX and DoomRPG written in AngularMaterial on NWJS for Windows, Linux and OSX." 
arch=('x86_64' 'i686') 
url="https://github.com/FreaKzero/ssgl-doom-launcher"
license=('MIT')
makedepends=('bower' 'git' 'nodejs-grunt-cli')
source=(
	'ssgl-doom-launcher-git::git+https://github.com/FreaKzero/ssgl-doom-launcher.git'
	'ssgl-launch'
	)
sha256sums=(
	    'SKIP'
	    '7dc5bd3454f96e5f3cc099f53d71aae96aa36bd1eeb724abe206d75640e8d959'
	    )

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
  mkdir -p $pkgdir/usr/share/ssgl
  mkdir -p $pkgdir/usr/share/ssgl/locales

  cd "$srcdir/$pkgname"

  install -m755 "build/SSGL/linux64/icudtl.dat" "$pkgdir/usr/share/ssgl/icudtl.dat"
  install -m755 "build/SSGL/linux64/nw.pak" "$pkgdir/usr/share/ssgl/nw.pak"
  install -m755 "build/SSGL/linux64/libffmpegsumo.so" "$pkgdir/usr/share/ssgl/libffmpegsumo.so"
  install -Dm755 "build/SSGL/linux64/locales/"*.pak "$pkgdir/usr/share/ssgl/locales"
	
  install -m755 "build/SSGL/linux64/SSGL" "$pkgdir/usr/share/ssgl/ssgl"
  install -m755 "$srcdir/ssgl-launch" "$pkgdir/usr/bin/ssgl"

}
