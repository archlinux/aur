# Maintainer: Conner Will (DampSock) <conner.will@connerwill.com>
# Contributor: Sergey Shepelev (temoto) <temotor@gmail.com>
# Contributor: Giuseppe Pagano (giuseongit) <giuseongit@latana.rocks>
# Contributor: Daniel Voogsgerd (DanielVoogsgerd)
#shellcheck disable=2148,2034,2154,2164

pkgname=rclonefzf-git
pkgver=1.0.4.r0.g0000000
pkgrel=1
pkgdesc='Interactive terminal UI for browsing and viewing files on rclone remotes using fzf'
arch=('any')
url='https://github.com/ConnerWill/rclonefzf'
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'rclone')
makedepends=('git')
provides=('rclonefzf')
conflicts=('rclonefzf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd rclonefzf || return 1
  local ver
  ver=$(git describe --tags --long --dirty 2>/dev/null) || return 1
  printf '%s\n' "${ver#v}" | sed 's/-/.r/;s/-/./'
}

build() {
  true
}

package() {
  cd "rclonefzf"

  ## Main executable
  install -vDm755 "bin/rclonefzf" "${pkgdir}/usr/bin/rclonefzf"

  ## Documentation
  install -vDm644 "docs/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  ## Man page
  install -vDm644 "docs/rclonefzf.1" "${pkgdir}/usr/share/man/man1/rclonefzf.1"

  ## License
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ## Zsh completion
  install -vDm644 "completion/_rclonefzf" "${pkgdir}/usr/share/zsh/site-functions/_rclonefzf"

  ## Bash completion
  install -vDm644 "completion/rclonefzf_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/rclonefzf"
}
