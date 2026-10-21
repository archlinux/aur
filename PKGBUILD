pkgname=gitcrawl-bin
_realver="0.16.0"
pkgver="0.16.0"
pkgrel=1
pkgdesc='Local-first GitHub issue and pull request crawler for maintainer triage'
arch=('x86_64' 'aarch64')
url='https://github.com/openclaw/gitcrawl'
license=('MIT')
provides=('gitcrawl')
conflicts=('gitcrawl')
options=('!strip')


source_x86_64=("gitcrawl-${_realver}-linux_amd64.tar.gz::https://github.com/openclaw/gitcrawl/releases/download/v${_realver}/gitcrawl_${_realver}_linux_amd64.tar.gz")
source_aarch64=("gitcrawl-${_realver}-linux_arm64.tar.gz::https://github.com/openclaw/gitcrawl/releases/download/v${_realver}/gitcrawl_${_realver}_linux_arm64.tar.gz")

sha256sums_x86_64=('3de6a82666c6295502e16e0967874bfb37b6dec013d79d5e60f74752565fd46b')
sha256sums_aarch64=('e873b0eb211c6394be1bf8e26b8d245e42c57cc30a0cbaaf9b45e7b1ac18ff8f')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local f
  for f in README.md CHANGELOG.md; do
    [[ -f "$f" ]] && install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
}
