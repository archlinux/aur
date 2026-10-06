# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
#
# Rendered by kubecom's packaging/aur/publish.sh from packaging/aur/PKGBUILD in
# github.com/neuroplastio/kubecom; change it there.
#
# The package is kubecom-launcher, installed as /usr/bin/kubecom (D293): the
# first time it runs it fetches the stable channel's newest kubecom into
# ~/.local/kubecom, checked against the release key built into it, and from then
# on runs that. `kubecom update` updates kubecom there; this package moves only
# when the launcher itself changes, and pkgver is the release it last changed in.
pkgname=kubecom-bin
_pkgname=kubecom
pkgver=26.10.06
pkgrel=1
pkgdesc="A fast, keyboard-driven terminal UI for Kubernetes (a launcher: kubecom itself lives in ~/.local/kubecom and updates with kubecom update)"
arch=('x86_64' 'aarch64')
url="https://github.com/neuroplastio/kubecom"
license=('Apache-2.0')
provides=("$_pkgname")
# Both the 2020 package and this one install /usr/bin/kubecom, so pacman must
# refuse to have both: the 2020 binary is not an upgrade of this one.
conflicts=("$_pkgname" "kube-commander")
# A static Go binary, stripped when it was built: no debug package, and nothing
# for strip to change about the bytes the sha256 below names.
options=('!strip' '!debug')

_release="https://github.com/neuroplastio/kubecom/releases/download/${pkgver}"
source_x86_64=("kubecom-launcher-${pkgver}-x86_64::${_release}/kubecom-launcher_linux_amd64")
source_aarch64=("kubecom-launcher-${pkgver}-aarch64::${_release}/kubecom-launcher_linux_arm64")
sha256sums_x86_64=('0b002a3ad53c4621fee6a0f0f42619adf12e8746cdf2da8c840a73995ab1dbd4')
sha256sums_aarch64=('9b881e06e50dfb414ed7b520a97e48951b90eb668b1c868ffd931cd021044942')

package() {
  install -Dm755 "kubecom-launcher-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
}
