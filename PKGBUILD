pkgname=gitcrawl-bin
_realver="0.15.2"
pkgver="0.15.2"
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

sha256sums_x86_64=('cc89e9ede23f9d7c2cf83451bc1a0c438a42c6c8d6abf865a3caf6f044951d22')
sha256sums_aarch64=('824be598079350e9879e6b8182826326c8fea52070d6df66e487cc514b3ba1c9')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local f
  for f in README.md CHANGELOG.md; do
    [[ -f "$f" ]] && install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
}
