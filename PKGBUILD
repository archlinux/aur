# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-04-03.

_pkgname=idos-package-updater-script
pkgname="${_pkgname}"
epoch=0
pkgver=20240403.1
pkgrel=1
pkgdesc="Bash script which automates the process of updating installed IDOS timetable browser related packages by reinstalling and thus fetching the newest version."
arch=('any')
license=('LicenseRef-Public_Domain')
groups=(
  "idos-timetable"
)
depends=(
  "bash"
  "util-linux" # for 'column'-executable.
  "pacman"
  "yay"
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()

source=(
  "idos-packages-update.sh"
  "copying.txt"
)

sha256sums=(
  "4c91d73d02ef0096ac46ccb79495ac015b573709a9b54bc806e3b98ff3c73f9a"
  "c3cbff25307e905545788f5c74cc137d79706c60549092f2a37919b93cf55ee3"
)


pkgver() {
  cd "${srcdir}"
  ./idos-packages-update.sh --version
}


prepare() {
  chmod a+x "${srcdir}/idos-packages-update.sh"
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  
  install -v -D -m755 "${srcdir}/idos-packages-update.sh" "${_instdir}/idos-packages-update.sh"
  install -v -D -m644 "${srcdir}/copying.txt" "${_licdir}/copying.txt"
  install -v -d -m755 "${_execdir}"

  ln -sv "${_instdirbase}/idos-packages-update.sh" "${_execdir}/"
}
