pkgname=rime-ice-data
pkgver=2026.04.13
pkgrel=1
pkgdesc='Rime Ice input method data set for librime, installed into /usr/share/rime-data'
arch=('any')
url='https://github.com/iDvel/rime-ice'
license=('GPL-3.0-only')
_commit='2bd2983c6c74ea49b3a013f150ade7f3b8a27515'
conflicts=(
  'rime-data'
  'librime-data'
  'brise'
  'rime-prelude'
  'rime-essay'
  'rime-luna-pinyin'
  'rime-bopomofo'
  'rime-cangjie'
  'rime-stroke'
  'rime-terra-pinyin'
)
provides=('rime-data' 'librime-data')
source=(
  "${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
  'fcitx5.yaml'
)
sha256sums=(
  '3df4aab9270497036988367ace8be3db02a0975a0da9e4e03b146e0131425ba9'
  '4e1db4bd11a8f68ef8c804d48c740451622e226f2defabb3fa628eb0fd09ff77'
)

package() {
  local datadir="${srcdir}/rime-ice-${_commit}"

  install -dm755 "${pkgdir}/usr/share/rime-data"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -r --no-preserve=ownership "${datadir}/". "${pkgdir}/usr/share/rime-data/"
  install -m644 "${srcdir}/fcitx5.yaml" "${pkgdir}/usr/share/rime-data/fcitx5.yaml"
  install -m644 "${datadir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/share/rime-data/.github"
  rm -f "${pkgdir}/usr/share/rime-data/.gitignore"
}
