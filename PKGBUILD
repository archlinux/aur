# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vmware-vcenter
pkgname=python-vmware-vcenter
pkgver=9.0.0.0
pkgrel=3
pkgdesc="VMware vCenter Server Python API Bindings"
arch=('any')
url="https://pypi.org/project/vmware-vcenter/"
license=('MIT')
depends=('python' 'python-vmware-vapi-common-client' 'python-vmware-vapi-runtime')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/2d/91/b75ff1019a5d9798c07cc56c269e192e06800f892eaf81be996b73255008/vmware_vcenter-${pkgver}-py3-none-any.whl")
sha256sums=('c344605b635a937b51d6175cbb005446b45f5786d634d5bdc6b40b668a5588df')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vmware_vcenter-${pkgver}-py3-none-any.whl"
    
    # Remove conflicting CIS files that are already provided by python-vmware-vapi-common-client
    # The common client provides the base CIS functionality that vcenter depends on
    rm -f "$pkgdir"/usr/lib/python*/site-packages/com/vmware/cis_client.py
    rm -f "$pkgdir"/usr/lib/python*/site-packages/com/vmware/cis/__init__.py
    rm -f "$pkgdir"/usr/lib/python*/site-packages/com/vmware/cis/task_client.py
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/com/vmware/__pycache__/cis_client.*
    rm -f "$pkgdir"/usr/lib/python*/site-packages/com/vmware/cis/__pycache__/__init__.cpython-313.pyc
    rm -f "$pkgdir"/usr/lib/python*/site-packages/com/vmware/cis/__pycache__/task_client.cpython-313.pyc
}
