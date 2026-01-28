# Maintainer: Conner Will (DampSock) <conner.will@connerwill.com>
# Contributor: Sergey Shepelev (temoto) <temotor@gmail.com>
# Contributor: Giuseppe Pagano (giuseongit) <giuseongit@latana.rocks>
# Contributor: Daniel Voogsgerd (DanielVoogsgerd)
#shellcheck disable=2148,2034,2154,2164

pkgname=yayfzf-git
pkgver=2.0.11.r0.g0000000
pkgrel=1
pkgdesc='Development (git) version of yayfzf, fzf-based interface for searching, installing, removing, and managing packages using yay'
arch=('any')
url='https://github.com/ConnerWill/yayfzf'
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'yay')
makedepends=('git')
provides=('yayfzf')
conflicts=('yayfzf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd yayfzf || return 1
  local ver
  ver=$(git describe --tags --long --dirty 2>/dev/null) || return 1
  printf '%s\n' "${ver#v}" | sed 's/-/.r/;s/-/./'
}

build() {
  true
}

package() {
  cd "yayfzf"

  ## Main executable
  install -vDm755 "bin/yayfzf" "${pkgdir}/usr/bin/yayfzf"

  ## Documentation
  install -vDm644 "docs/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  ## Man page
  install -vDm644 "docs/yayfzf.1" "${pkgdir}/usr/share/man/man1/yayfzf.1"

  ## License
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ## Zsh completion
  install -vDm644 "completion/_yayfzf" "${pkgdir}/usr/share/zsh/site-functions/_yayfzf"

  ## Bash completion
  install -vDm644 "completion/yayfzf_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/yayfzf"
}
