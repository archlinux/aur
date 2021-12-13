# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor : Christian Rebischke <chris.rebischke[at]archlinux[dot]org>


pkgname=social-engineer-toolkit

pkgver=8.0.3
pkgrel=4

pkgdesc='The Social-Engineer Toolkit (SET)'
arch=('any')
url="https://github.com/trustedsec/$pkgname"
license=('BSD')

depends=('python' 'python-pexpect' 'python-pycryptodome' 'python-requests' 'python-pyopenssl'
         'python-pefile' 'impacket' 'python-qrcode' 'python-beautifulsoup4')
optdepends=('metasploit' 'java-runtime' 'openssl')

changelog=CHANGELOG
backup=('etc/setoolkit/set.config')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ba07e90ac461c3fe5ac1582875699bd3247c7168ea7ee9ae34f2a51199437c08')


prepare() { rm -r "$pkgname-$pkgver"/{seupdate,setup.py,requirements.txt,.git{hub,ignore}}; }

build() { python -O -m compileall "$pkgname-$pkgver"; }

package() {
  install -Dm644 "$pkgname-$pkgver/src/core/config.baseline" "$pkgdir/etc/setoolkit/set.config"
  install -dm755 "$pkgdir/usr/"{bin,share/{doc,licenses/setoolkit}}
  cp -a --no-preserve=o "$pkgname-$pkgver" "$pkgdir/usr/share/setoolkit"
  cd "$pkgdir/usr/share"
  mv setoolkit/readme    doc/setoolkit
  mv setoolkit/README.md doc/setoolkit/
  ln -s /usr/share/doc/setoolkit                        setoolkit/readme
  ln -s /usr/share/doc/setoolkit/LICENSE                licenses/setoolkit/
  ln -s /usr/share/setoolkit/se{toolkit,proxy,automate} ../bin/
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
