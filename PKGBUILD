# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Dusty Phillips <dusty@buchuki.com>

pkgname=jedit
pkgver=5.7.0
pkgrel=1
pkgdesc='Editor for programmers'
arch=('any')
url='http://jedit.org/'
license=('GPL')
depends=('java-runtime>=12')
makedepends=('gendesk')
optdepends=('java-environment: for java development'
            'noto-fonts: a usable font')
options=('!emptydirs')
source=("https://sourceforge.net/projects/jedit/files/jedit/$pkgver/jedit-$pkgver-noarch-1sao.tgz"
        'jedit.sh' 'jeditbg.sh' 'jedit.props')
sha256sums=('cee72bebf7c6e4ed63ad152e4038cdcc1cabfda5709fd61555952b758b4e92f9'
            'a32f0344a793528ac10c3a59a75bb615353604a7980a7293ef453a7af8c38f64'
            'a1dd1b688f08c5c967861fe80df13cac201afa6dcfcecc9a289b2c3bec7c8915'
            'dc5fe0050321d4f34bce556895fbc39cc6f7df194e14eb4f6ea53166a4d82347')

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --exec 'jeditbg %U' \
    --name jEdit \
    --genericname Editor
}

package() {
  install -d "$pkgdir/usr/share/"{doc,java}
  cp -r "usr/doc/$pkgname-$pkgver" "$pkgdir/usr/share/doc/$pkgname"
  cp -r "usr/share/$pkgname-$pkgver" "$pkgdir/usr/share/java/$pkgname"
  install -Dm755 jedit.sh "$pkgdir/usr/bin/jedit"
  install -Dm755 jeditbg.sh "$pkgdir/usr/bin/jeditbg"
  install -Dm644 jedit.props "$pkgdir/usr/share/jedit/default.props"
  install -Dm644 "$pkgdir/usr/share/java/jedit/doc/jedit.png" \
    "$pkgdir/usr/share/pixmaps/jedit.png"
  install -Dm644 jedit.desktop "$pkgdir/usr/share/applications/jedit.desktop"
}
