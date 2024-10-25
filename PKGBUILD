# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Contributor: sekret

_pkgname=clyrics
pkgname=$_pkgname-git
pkgver=0.17.r0.gf23fc20
pkgrel=1

pkgdesc="An extensible lyrics fetcher, with daemon support for cmus and mocp."
url="https://github.com/trizen/clyrics"

arch=('any')
license=('GPL-3.0-or-later')

depends=('perl-www-mechanize' 'perl-io-html' 'perl-lwp-protocol-https')
makedepends=('git')
optdepends=('moc: daemon support for moc player'
            'cmus: daemon support for cmus player')

provides=("$_pkgname")
conflicts=("$_pkgname")

install='readme.install'
source=("$_pkgname::git+https://github.com/trizen/clyrics.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  cd plugins
    for i in *
    do
        install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
    done
}
