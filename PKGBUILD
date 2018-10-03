# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Ryan Marcus <ryan@ryanmarc.us>
# With lots of borrowing from "gitea".

pkgname=gitea-bin
pkgver=1.5.1
pkgrel=3
pkgdesc="Git with a cup of tea, binary installation"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitea.io/'
license=('MIT')
depends=('git')
optdepends=(
	'sqlite: SQLite support'
	'mariadb: MariaDB support'
	'postgresql: PostgreSQL support'
	'pam: Authentication via PAM support'
	'redis: Redis support'
	'memcached: MemCached support'
	'openssh: GIT over SSH support'
)
backup=('etc/gitea/app.ini')
provides=('gitea')
conflicts=('gitea' 'gitea-git')
source=('gitea.tmpfiles'
        'gitea.service'
        'LICENSE'
        'app.ini.sample')
source_x86_64=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-amd64.xz")
source_i686=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-386.xz")
source_arm=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-arm-5.xz")
source_armv6h=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-arm-6.xz")
source_armv7h=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-arm-7.xz")
source_aarch64=("gitea-${pkgver}-${CARCH}.xz"::"https://dl.gitea.io/gitea/${pkgver}/gitea-${pkgver}-linux-arm64.xz")
sha256sums=('4bcddd5d05ce17968866beb5690517710e040554c9a555a7af06ca549be8c3b0'
            '4bc8d49f6eb79d881cfb124a0be7e5c1336bfd0e1842fab98d76972c2a0d2e03'
            'ed2f10a9d78b8c6c9ef33f1420d0eb266981891caf2f15d630553f02dc60d3ae'
            '2b52802b43fac5c772235670ebc8ca11b538fb6dcc356513bc70d5bf9ddab9a9')
sha256sums_x86_64=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')
sha256sums_i686=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')
sha256sums_arm=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')
sha256sums_armv6h=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')
sha256sums_armv7h=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')
sha256sums_aarch64=('b8933a2929621857bf1f48d56f2a8cca378c37c9eb9a388c0a743e9f2e626beb')

package() {
  install -Dm755 "${srcdir}/gitea-${pkgver}-${CARCH}" "${pkgdir}"/usr/bin/gitea
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}"/gitea.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "${srcdir}"/gitea.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/gitea.conf
  install -dm 775 -o root -g git "${pkgdir}"/etc/gitea/
  install -m 664 -o root -g git app.ini.sample "${pkgdir}"/etc/gitea/app.ini.sample
}

# vim: ts=2 sw=2 et:
