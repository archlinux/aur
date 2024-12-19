# Maintainer: envoltion
# Contributor: l-koehler <lorenz.koehler@posteo.de>
# Contributor: Rihards Skuja <rhssk at posteo dot eu>
# Contributor: Vojtech Kral <vojtech_kral^hk>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect-git
_pkgname=kdeconnect
pkgver=24.12.0+r4729+g2ab325c55
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
arch=('x86_64')
url='https://kdeconnect.kde.org/'
license=('GPL-2.0-or-later')
depends=(dbus
         gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kdeclarative
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knotifications
         kpeople
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kwindowsystem
         libfakekey
         libx11
         libxkbcommon
         libxtst
         modemmanager-qt
         openssl
         pulseaudio-qt
         qqc2-desktop-style
         qt6-base
         qt6-connectivity
         qt6-declarative
         qt6-multimedia
         qt6-wayland
         solid
         wayland)
makedepends=(extra-cmake-modules
            kdoctools
            kpackage # kpackage_install_package
            wayland-protocols
            git)
optdepends=('python-nautilus: Nautilus integration'
            'qt6-tools: for some runcommand plugin actions'
            'sshfs: remote filesystem browser')
provides=("kdeconnect")
conflicts=("kdeconnect")
source=("git+https://invent.kde.org/network/${_pkgname}-kde.git")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_pkgname}-kde"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
	cmake -B build -S "${_pkgname}-kde" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
