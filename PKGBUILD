# Maintainer: Rin Leaf <tiflew123 at gmail dot com>
pkgname=sftool-gui-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="GUI version of sftool, a download tool for the SiFli family of chips"
arch=('x86_64')
url="https://github.com/OpenSiFli/sftool-gui"
license=('Apache-2.0')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
makedepends+=(
	"libarchive"
)
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/v${pkgver}/sftool_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=('7951153ac12b733a4033d0ba1571e7c0266f0380174c11dce9c23433b6e33a1a')

function pkgver() {
  mkdir control
	tar -xf control.tar.gz -C ./control
	cat control/control | grep 'Version: ' | cut -c '10-'
}

function package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}

function post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}

function post_upgrade() {
  post_install
}

function post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}
