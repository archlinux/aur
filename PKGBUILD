# Maintainer: cvlc12 <cvlc12 at outlook dot fr>

pkgname=gsai-git
pkgver=r11.bcea30c
pkgrel=1
pkgdesc='Sign Arch Isos (for Secure Boot) - git checkout'
arch=('any')
url="https://github.com/cvlc12/gsai"
license=('MIT')
depends=('libisoburn' 'mtools')
optdepends=('sudo: for running commands as root when needed'
  			'doas: alternative to sudo for privilege escalation'
  			'polkit: to use run0 for privilege escalation')

makedepends=('git')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("git+https://github.com/cvlc12/gsai.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 bin/gsai "$pkgdir/usr/bin/gsai"
	install -Dm644 lib/gsai_utils.sh "$pkgdir/usr/lib/gsai/gsai_utils.sh"
	install -Dm644 shell/bash-completion "$pkgdir/usr/share/bash-completion/completions/gsai"
	install -Dm644 shell/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_gsai"
}
