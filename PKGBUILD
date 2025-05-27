# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgver=1.5.2
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
#changelog="$pkgname.changelog"
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
  '898f56ee9b8363f75b15681fcc6feb7879e449f50c334ea9e432d3a73d07cb98'
  'SKIP' 'SKIP'  # Skip to my lou
)
b2sums=(
  '905782fbbbc82993124cd0ebd6f99b5683c743e6053ddfcf6bdab7f601a7a2737a2dad2c7ad2b36a7a31201a8a4bd4066a57b7feceac739b5bec9b8840a13a49'
  'SKIP' 'SKIP'  # Skip to my lou
)

# eof
