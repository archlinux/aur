# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

_ver=0.4.1-alpha2
pkgver() { sed 's/\(alpha\)\([0-9]\+\)/\1_\2/' <<<"${_ver/-/.}"; }
pkgver=0.4.1.alpha_2
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
backup=("usr/lib/$pkgname/default.conf")
source=("$pkgname-$_ver.tgz::$url/archive/v$_ver.tar.gz")
b2sums=('6108556cf110073c30783d90b18f6dafb992042af70ec180b6b750057f538f2fc8a42543bcca4dd651196392057e9f9ca5319c6eb9bae0bb783b3a1c62ff1f69')


prepare() {
  cd "$pkgname-$_ver"
  sed -i 's/^\(save-logs-home\s*=\s*\)False/\1True/' default.conf
}

package() {
  cd "$pkgname-$_ver"
  install -dm755 "$pkgdir/usr"/{bin,"lib/$pkgname"}
  cp -a --no-preserve=o db lib thirdparty default.conf dirsearch.py "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
  ln -s /usr/lib/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
