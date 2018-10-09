# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Ryan Marcus <ryan@ryanmarc.us>
# With lots of borrowing from "gitea".

pkgname=gitea-bin
pkgver=1.5.2
pkgrel=1
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
sha256sums_x86_64=('3ae346f0cad2ee91e3399b0c37e73de84bf8837d840d6283962a499471b4231a')
sha256sums_i686=('4b25494fa398af0691d2dcdac7963b44d07bcf74ab72fc9fd815bbf5c0951a20')
sha256sums_arm=('36c1abf9c54dee9b1fee21e2449e5643a6843df5bb24e847aefda8ae551f0a61')
sha256sums_armv6h=('b2571a583778e4a5212313c75b3c6b297cffa9aed7ff1e3743ce0d4a8f1ed158')
sha256sums_armv7h=('b409121e6cfcbdc8b84bdf15ea903f34e21a8a2f192a74a587190831d7ff808f')
sha256sums_aarch64=('13c6b4925019f27c42ec14539cd8a8118f89e050bc214d6ee96ee3a489e79068')

package() {
  install -Dm755 "${srcdir}/gitea-${pkgver}-${CARCH}" "${pkgdir}"/usr/bin/gitea
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}"/gitea.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "${srcdir}"/gitea.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/gitea.conf
  install -dm 775 -o root -g git "${pkgdir}"/etc/gitea/
  install -m 664 -o root -g git app.ini.sample "${pkgdir}"/etc/gitea/app.ini.sample
}

# vim: ts=2 sw=2 et:
