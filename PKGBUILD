# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgver=1.5.0
_pkgver=1_5_0
pkgrel=2
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
  "$url/releases/download/RELEASE_$_pkgver/mlmmj-$pkgver.tar.xz"
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
  'de0be6c2910ac8bf8291dc86a3819a08b7cdb1019c54ede1791e166967bf1baa'
  'SKIP' 'SKIP'  # Skip to my lou
)
b2sums=(
  '9edc446cc79e17f3c4a8d63d34129718b60b7bddacbf9002c75c6c96c6c0b97f4834c24f3a15f4d0e1c275e336f2d23e03d14feaf022ef91bd35ca4d1caaf5bc'
  'SKIP' 'SKIP'  # Skip to my lou
)

# eof
