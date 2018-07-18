# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2016-12-11.

_pkgname=idos-package-updater-script
pkgname="${_pkgname}"
epoch=0
pkgver=20180718.6
pkgrel=1
pkgdesc="Bash script which automates the process of updating installed IDOS timetable browser related packages by reinstalling and thus fetching the newest version."
arch=('any')
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
  "util-linux" # for 'column'-executable.
  "pacman"
  "yaourt"
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
  "66843bc0c490e11dbd50c662d126f526bc7e798e18c11fe4f05b4fea4f732607"
  "c3cbff25307e905545788f5c74cc137d79706c60549092f2a37919b93cf55ee3"
)


pkgver() {
  "${srcdir}/idos-packages-update.sh" --version
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
