# Maintainer: bethropolis <bethropolis at gmail dot com>
pkgname='localgo-bin'
pkgver=0.3.7
pkgrel=1
pkgdesc='LocalSend v2.1 protocol implementation — LAN file transfer CLI'
url='https://github.com/bethropolis/localgo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('localgo')
conflicts=('localgo' 'localgo-git')
optdepends=('bash: bash shell completions' 'zsh: zsh shell completions' 'fish: fish shell completions' 'xclip: clipboard support on X11' 'xsel: clipboard support on X11 (alternative)' 'wl-clipboard: clipboard support on Wayland')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/bethropolis/localgo/releases/download/v${pkgver}/localgo_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/bethropolis/localgo/releases/download/v${pkgver}/localgo_${pkgver}_linux_amd64.tar.gz")

sha256sums_aarch64=('928606885e2578231f249df8d475d42ea5ac4e8a4bd2d132f9203bb4634f5aa1')
sha256sums_x86_64=('9d1a7893308f2cbf0b182ad6dd1c3af785ac33f0badeb7734ffb80f094819427')


package() {
  install -Dm755 "./localgo" "${pkgdir}/usr/bin/localgo"

  install -Dm644 "./LICENSE" \
  "${pkgdir}/usr/share/licenses/localgo-bin/LICENSE"

  install -Dm644 "./README.md" \
  "${pkgdir}/usr/share/doc/localgo-bin/README"

  install -Dm644 "./docs/GETTING_STARTED.md" \
  "${pkgdir}/usr/share/doc/localgo-bin/GETTING_STARTED.md"

  install -Dm644 "./scripts/localgo.env.example" \
  "${pkgdir}/usr/share/doc/localgo-bin/localgo.env.example"

  # Shell completions — optional, only install if the shell is present
  if command -v bash &>/dev/null; then
  install -Dm644 "./scripts/bash_completion.sh" \
  "${pkgdir}/usr/share/bash-completion/completions/localgo"
  fi

  if command -v zsh &>/dev/null; then
  install -Dm644 "./scripts/zsh_completion.zsh" \
  "${pkgdir}/usr/share/zsh/site-functions/_localgo"
  fi

  if command -v fish &>/dev/null; then
  install -Dm644 "./scripts/fish_completion.fish" \
  "${pkgdir}/usr/share/fish/vendor_completions.d/localgo.fish"
  fi

  if [[ -f "./scripts/localgo-pkg.service" ]]; then
  install -Dm644 "./scripts/localgo-pkg.service" \
  "${pkgdir}/usr/lib/systemd/user/localgo.service"
  fi
}
