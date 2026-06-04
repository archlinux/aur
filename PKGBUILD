# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mistralai
pkgname=python-$_name
pkgver=2.4.9
pkgrel=1
pkgdesc="Python Client SDK for the Mistral AI API."
arch=('any')
url="https://github.com/mistralai/client-python"
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-dateutil' 'python-typing-inspection' 'python-opentelemetry-api' 'python-opentelemetry-semantic-conventions' 'python-jsonpath-python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-google-auth: gcp' 'python-requests: gcp'
            'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents'
            'python-websockets: realtime'
            'python-opentelemetry-sdk: telemetry' 'python-opentelemetry-exporter-otlp-proto-http: telemetry'
            'python-azure-storage-blob: workflow_payload_offloading_azure' 'python-azure-identity: workflow_payload_offloading_azure' 'python-aiohttp: workflow_payload_offloading_azure'
            'python-gcloud-aio-storage: workflow_payload_offloading_gcs'
            'python-aioboto3: workflow_payload_offloading_s3'
            'python-azure-storage-blob: workflow_payload_offloading' 'python-azure-identity: workflow_payload_offloading' 'python-aiohttp: workflow_payload_offloading' 'python-gcloud-aio-storage: workflow_payload_offloading' 'python-aioboto3: workflow_payload_offloading'
            'python-cryptography: workflow_payload_encryption'
            'python-msgpack: workflow_payload_compression' 'python-zstandard: workflow_payload_compression')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab5e15a71574fc469e42a8f84a42b233615ffc034507b4d266bd1e3942995300')

build() {
  cd "$srcdir"/client-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/client-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

