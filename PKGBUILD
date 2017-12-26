# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.9.2
pkgrel=1
pkgdesc="SSH Agent Plugin for KeePass - Beta Version"
license=('GPL')
makedepends=('git' 'nuget')
depends=('keepass')
optdepends=('openssh: For integration with ssh-agent' 'gnupg: For integration with GnuPG SSH agent')
provides=('keepass-plugin-keeagent')
conflicts=('keepass-plugin-keeagent')
arch=('any')
url="http://lechnology.com/software/keeagent/"
source=("${pkgname}-${pkgver}::git+https://github.com/dlech/KeeAgent.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  git submodule update --init --recursive

  nuget restore
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  xbuild /property:Configuration=ReleasePlgx KeeAgent.sln
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 KeeAgent/bin/ReleasePlgx/KeeAgent.plgx -t "$pkgdir/usr/share/keepass/plugins/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 GPL2.txt "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
}
