# Maintainer:
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

_ALL_OFF="$(tput sgr0)"
_BOLD="${ALL_OFF}$(tput bold)"
_BLACK="${BOLD}$(tput setaf 0)"
_BLUE="${BOLD}$(tput setaf 4)"
_CYAN="${BOLD}$(tput setaf 6)"
_GREEN="${BOLD}$(tput setaf 2)"
_MAGENTA="${BOLD}$(tput setaf 5)"
_RED="${BOLD}$(tput setaf 1)"
_WHITE="${BOLD}$(tput setaf 7)"
_YELLOW="${BOLD}$(tput setaf 3)"

notice() {
  printf "${_WHITE} $1${_ALL_OFF}\n"
}

>&2 echo
>&2 notice 'Abricotine development and support ceased in July 2023.'
>&2 notice 'The developer recommends using a different editor because'
>&2 notice 'Abricotine "hasn'\''t evolved in years and some dangerous'
>&2 notice 'bugs have recently been reported"'
>&2 notice
>&2 notice 'https://github.com/brrd/abricotine/issues/347'

for i in {1..5} ; do
  >&2 sleep 1
  >&2 echo -n '. '
done
>&2 echo

_pkgname="abricotine"
pkgname="$_pkgname-bin"
pkgver=1.1.4
pkgrel=2
pkgdesc="A markdown editor with inline preview (discontinued)"
arch=('x86_64')
url="https://github.com/brrd/Abricotine/issues/347"
license=('GPL-3.0-only')

depends=(
  'libnotify' # notify-send
  'libxss'
)

conflicts=("abricotine")
provides=("abricotine")

source=(
  "https://github.com/brrd/Abricotine/releases/download/v${pkgver}/abricotine_${pkgver}_amd64.deb"
  "abricotine.desktop"
  "abricotine.sh"
)
sha256sums=(
  '01627c9eeb063c6a8f75f119e41ab014c6ec20234731043f507c9e8d7fbf6cfb'
  '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c'
  'fe52b9b8331f6e5cc9fe95eb8de40bf40958fc38c26505fdd4d896b9055b1f25'
)

install="abricotine.install"

build() {
  tar xf data.tar.xz
}

package() {
  install -dm755 "$pkgdir/opt/abricotine"
  cp -r opt/Abricotine/* "$pkgdir/opt/abricotine"

  install -Dm755 abricotine.sh "$pkgdir/usr/bin/abricotine"

  install -Dm644 "abricotine.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 \
  "usr/share/icons/hicolor/64x64/apps/abricotine.png" -t "$pkgdir/usr/share/pixmaps/"
}
