# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgver=1.5.1
pkgrel=1
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
depends=('bash' 'glibc' 'smtp-server')
optdepends=(
  'perl: for running some of the contributed scripts'
  'python: for running some of the contributed scripts'
)
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
#url='http://mlmmj.org/'
url='https://codeberg.org/mlmmj/mlmmj'
license=('MIT')  # SPDX-License-Identifier: MIT
# Development has moved to Codeberg
source=(
  "$url/releases/download/RELEASE_$pkgver/mlmmj-$pkgver.tar.xz"
  'sysuser.conf'
  'tmpfile.conf'
)
changelog="$pkgname.changelog"
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"

  # Tests require “atf-c”. Anyone?
  ./configure --prefix=/usr --disable-tests

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ChangeLog FAQ README.* TODO TUNABLES.md UPGRADE

  cp -vfa contrib "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    AUTHORS COPYING LICENSE

  cd "$srcdir"

  install -vDm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha256sums=(
  'ea2fca5a9d7bfe1a6712b72b0185376e7e1f5817d83dcf11ad9491b3c75f075e'
  'SKIP' 'SKIP'  # Skip to my lou
)
b2sums=(
  '99a4ba66e2f6039456d010d437e05d093d87cded05c65cecc897e00e591c70dedae0fe9b90d092d84c8db3cd90e821cc33102bbfa7c7a39537fe4c015430a2d1'
  'SKIP' 'SKIP'  # Skip to my lou
)

# eof
