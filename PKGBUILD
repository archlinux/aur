#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=sunwait-git
pkgver=r24.102cb41
pkgrel=1
pkgdesc="Sunwait calculates sunrise or sunset times with civil, nautical, astronomical and custom twilights, for use with Windows Task Scheduler or 'cron' on Linux. Git version with new Github upstream."
url="https://github.com/risacher/sunwait"
license=("GPL3")
arch=("x86_64")

# Dependencies
depends=()
makedepends=("git")

# Download information
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}" || exit
  make
}

package() {
  cd "${srcdir}/${pkgname}" || exit
  install -Dm755 sunwait "${pkgdir}/usr/bin/sunwait"
}
