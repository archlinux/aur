# Maintainer: Arpan <arpan@example.com>
pkgname=alethea
pkgver=0.1.0
pkgrel=1
pkgdesc="Agentic AI-powered Digital Forensics & Legal Evidence Platform"
arch=('any')
url="https://github.com/username/alethea"
license=('MIT')
depends=(
    'python>=3.11'
    'python-pip'
    'python-typer'
    'python-rich'
    'python-pydantic'
    'python-pydantic-settings'
    'ollama'
)
optdepends=(
    'blackarch-forensic: Complete BlackArch forensic toolkit'
    'sleuthkit: Disk forensics (fls, mmls, mactime)'
    'volatility3: Memory forensics'
    'nmap: Network scanning'
    'wireshark-cli: Network packet analysis'
    'tcpdump: Packet capture'
    'binwalk: Firmware analysis'
    'foremost: File carving'
    'bulk-extractor: Extract features from disk images'
    'sherlock: Username OSINT'
    'holehe: Email OSINT'
    'maigret: Multi-platform username search'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
    echo ""
    echo "=============================================="
    echo "  Alethea - Digital Forensics Platform"
    echo "=============================================="
    echo ""
    echo "To get started:"
    echo "  sudo alethea investigate"
    echo ""
    echo "For autonomous AI investigation:"
    echo "  sudo alethea auto 'investigate USB devices'"
    echo ""
    echo "RECOMMENDED: Install forensic tools:"
    echo "  sudo alethea install --all"
    echo ""
    echo "Or install BlackArch forensic suite:"
    echo "  sudo pacman -S blackarch-forensic"
    echo ""
    echo "Ensure Ollama is running:"
    echo "  ollama serve"
    echo "  ollama pull gemma3:latest"
    echo ""
}
