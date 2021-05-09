# Arch PKGBUILD for NoteKit
# Copyright (C) 2020 sp1rit <sp1ritCS@protonmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Maintainer: sp1rit <sp1ritCS@protonmail.com>

_basename=notekit
pkgname="${_basename}-clatexmath-git"
pkgver=r173.1a16c1e
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64" "aarch64" "i686" "armv7h" "s390x")
url="https://github.com/blackhole89/notekit"
license=("GPL-3.0")
depends=("clatexmath" "gtkmm3>=3.2" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson")
provides=("${_basename}")
conflicts=("${_basename}" "${_basename}-git")
source=("${_basename}::git+https://github.com/blackhole89/notekit.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_basename}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_basename}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR="${pkgdir}" meson install -C _build
}
