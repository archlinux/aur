# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.14.0_rc.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('apache')
provides=('kubectl' 'kubectl-bin')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl")
sha512sums=('bf0ea887d26959e7ef92161bbbad66b5590a4d9457db0af6e57b09ed05867fe67f04255009aecd70dabf9fc3e200aca6b610b5fb64567aa3ffb6fa9bde8a63c5')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}
