# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: goten002 <goten002@gmail.com>
# Contributor: epinull

pkgname=mynotex
pkgver=1.4.1.0
pkgrel=5
pkgdesc="A free note-taking, document file and activity manager for GNU/Linux"
url="https://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')
optdepends=('gnupg: for notes encryption')

gdrive_download() {
  gUrl=https://drive.google.com/uc?export=download
  curl -sc gc "${gUrl}&id=${1}" >/dev/null
  curl -k -C - -Lb gc "${gUrl}&confirm=t&id=${1}" -o $2
}

prepare() {
  if [ "$(uname -m | grep '64')" = "x86_64" ]; then
    file=mynotex_1.4.1.0_amd64.deb
    sha256=0026f7182fd0f9c38b6c220a3ea82642d93241f78ba33360f0d66270bf9f8673
    gdrive_download 1emkXcCopQJkgpI2ehYpF1smz4vlsLz7L $file
  else
    file=mynotex_1.4.1.0_i386.deb
    sha256=7a2b049d166609bec364e34ddf9899ff218c2fea410014f0af78472ee0fb4b90
    gdrive_download 1qlwYZ2rLrvbzMp1ap6NfPzZGpbwqZk6K $file
  fi

  echo "$sha256 $file"|sha256sum -c
  bsdtar xf $file
}

package() {
  tar -axf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/mynotex/mynotex" "${pkgdir}/usr/bin/mynotex"
}

