pkgname=knap
pkgver=0.6.0
pkgrel=1
_dayjsver=1.11.23
pkgdesc="Flexible template engine for creating Markdown"
arch=('any')
url="https://github.com/obsidianmd/knap"
license=('MIT')
depends=('nodejs>=20')
conflicts=('knap-git')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
        "https://registry.npmjs.org/dayjs/-/dayjs-${_dayjsver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz" "dayjs-${_dayjsver}.tgz")
sha256sums=('e4052bc897db24d4f1a44f59cd8247551a914867229a9ba1a96939f4b02442e4'
            '7da0ff55ddb6d4050b91ea0a11a8e9d92c048305155039387373f20be080e594')

package() {
  local module_dir="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -d "${module_dir}/node_modules/dayjs" "${pkgdir}/usr/bin"
  bsdtar -xf "${pkgname}-${pkgver}.tgz" -C "${module_dir}" \
    --strip-components 1 --no-same-owner
  bsdtar -xf "dayjs-${_dayjsver}.tgz" -C "${module_dir}/node_modules/dayjs" \
    --strip-components 1 --no-same-owner
  ln -s "../lib/node_modules/${pkgname}/dist/cli.js" "${pkgdir}/usr/bin/knap"
  install -Dm644 "${module_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
