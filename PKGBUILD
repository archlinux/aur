# Maintainer: bromigOS <packages@bromigos.org>
# The standalone CLI, Textual console, adapters, catalog and provisioning.
pkgname=bromigos-lab
pkgver=0.1.0
pkgrel=1
pkgdesc='Standalone homelab console, adapters, model catalog and reviewed provisioning'
arch=('any')
url='https://github.com/bromigos-org/bromigOS'
license=('MIT OR Apache-2.0')
depends=('python' 'python-textual')
optdepends=('gnupg: verify signed model catalog updates'
            'ansible-core: apply a reviewed lab provision plan'
            'libvirt-python: manage VMs on a local libvirt host'
            'qemu-base: run local KVM guests and manage their disks'
            'cloud-image-utils: make cloud-init seeds for local KVM guests'
            'helm: provision an existing Kubernetes cluster'
            'sops: encrypt generated lab credentials without Vault'
            'age: recipients for encrypted lab credentials'
            'openssh: provision a Linux box over SSH'
            'bromigos-homelab: desktop panels, live decks and VECTOR plugins'
            'bromigos-core: desktop target commands, art jobs and Den TV media tools'
            'kubectl: the kubernetes source (read-only kubeconfig)'
            'github-cli: the github source (CI, PRs)'
            'vault: @vault: references in homelab.toml'
            'python-numpy: VECTOR Gnosis memory mirror'
            'python-huggingface-hub: bromigos lab models refresh --hf (newer models on Hugging Face)'
            'python-boto3: s3 sources: bucket sizes (with a read-only key)'
            'poppler: the ocr job kind: PDF pages')
makedepends=('python' 'gnupg')
checkdepends=('python-textual' 'python-cairo' 'python-gobject' 'pango' 'python-psutil')
options=('!debug')
_tag=bromigos-lab-v0.1.0
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('de6777141a90e03169535d414259aaa8b716dfc09e361d3363ef321b9f7a8a5f')
_source_root() { printf '%s' "$srcdir/bromigOS-${_tag#v}"; }
check() {
  _root=$(_source_root)
  cd "$_root/homelab"
  BROMIGOS_HOMELAB_CONFIG=/nonexistent PYTHONPATH=lib:../lib:tests python -m unittest discover -s tests
}
package() {
  _root=$(_source_root)
  bash "$_root/packaging/install-lab.sh" "$_root" "$pkgdir"
}
