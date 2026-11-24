# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resumx
_npmname=@resumx/resumx
pkgver=0.2.0
pkgrel=1
pkgdesc="Render resumes from Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/resumx/resumx"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/resumx-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('fd320c0ba6240e4fd5d2508bed506f5aeb2a51e5f45d40266dc9d61ce82128f2')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
