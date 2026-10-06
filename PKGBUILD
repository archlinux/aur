pkgname=gitcrawl-bin
_realver="0.15.0"
pkgver="0.15.0"
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

sha256sums_x86_64=('abdab92fbfd1bc407a798b7dabc37fe67da3c42966f63a65e70193fac808b495')
sha256sums_aarch64=('63ff95a7f84d42f983c383e59f6882799fe018dfd5e1f5d1702379f9c2d73b3c')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local f
  for f in README.md CHANGELOG.md; do
    [[ -f "$f" ]] && install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
}
