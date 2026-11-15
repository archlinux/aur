# Maintainer: dim-ghub <59436063+dim-ghub@users.noreply.github.com>

pkgname=venture-bin
_pkgname=venture
pkgver=0.2.4
pkgrel=1
pkgdesc='Meta Quest emulator for PC VR (prebuilt release)'
arch=('x86_64')
url='https://venture-emu.org/'
license=('GPL-3.0-or-later')
depends=('glibc>=2.35' 'gcc-libs' 'vulkan-icd-loader')
optdepends=('libsecret: keep sign-ins in the desktop keyring'
            'fontconfig: system fonts in the launcher'
            'monado: OpenXR runtime'
            'wivrn-server: OpenXR runtime for streaming to a standalone headset')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("Venture-$pkgver-linux-x86_64.tar.gz::https://github.com/Villagers654/Venture/releases/download/v$pkgver/Venture-$pkgver-linux-x86_64.tar.gz")
sha256sums=('98ce67a320e4edbbaab7062c424a4dfa0333bd57e962740cf3a5fda104591a78')

package() {
    cd "$srcdir/Venture-linux64"
    install -d "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share"
    cp -a share/. "$pkgdir/usr/share/"
    find . -mindepth 1 -maxdepth 1 ! -name share -exec cp -a {} "$pkgdir/opt/$_pkgname/" \;
    ln -s "/opt/$_pkgname/venture" "$pkgdir/usr/bin/venture"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
