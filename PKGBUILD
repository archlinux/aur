# Maintainer: ExploitCraft <emonkk06@gmail.com>

pkgname=reconninja
pkgver=9.1.1
pkgrel=1
pkgdesc="Autonomous multi-phase security reconnaissance framework"
arch=('any')
url="https://github.com/ExploitCraft/ReconNinja"
license=('MIT')
depends=(
  # ── Runtime ───────────────────────────────────────────────────────────────
  'python>=3.10'

  # ── Core Python deps ──────────────────────────────────────────────────────
  'python-rich'
  'python-dotenv'
  'python-requests'
  'python-dnspython'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-flask'
  'python-yaml'
  'python-ldap3'
  'python-whois'
  'python-ipwhois'

  # ── Optional Python deps (included as hard deps for full install) ──────────
  'python-groq'
  'python-openai'
  'python-shodan'
  'python-pymongo'
  'python-pysnmp'
  'python-weasyprint'
  'python-fpdf2'

  # ── Port scanners ─────────────────────────────────────────────────────────
  'nmap'
  'masscan'
  'rustscan'

  # ── Web & directory scanners ──────────────────────────────────────────────
  'ffuf'
  'feroxbuster'
  'dirsearch'
  'nikto'
  'whatweb'
  'gobuster'
  'sqlmap'
  'wfuzz'

  # ── Subdomain enumeration ─────────────────────────────────────────────────
  'subfinder'
  'amass'
  'assetfinder'

  # ── HTTP probing & screenshots ────────────────────────────────────────────
  'httpx-bin'
  'gowitness'
  'aquatone'

  # ── Vulnerability scanning ────────────────────────────────────────────────
  'nuclei'

  # ── DNS tools ─────────────────────────────────────────────────────────────
  'python-dnsrecon'
  'dnsx'
  'bind-tools'
  'whois'

  # ── WAF detection ─────────────────────────────────────────────────────────
  'wafw00f'

  # ── Network utilities ─────────────────────────────────────────────────────
  'net-tools'
  'curl'

  # ── Wordlists ─────────────────────────────────────────────────────────────
  'seclists'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

pkgver() {
  cd "ReconNinja"
  grep -oP '__version__\s*=\s*"\K[^"]+' info/info.py | head -1
}

source=("${pkgname}::git+https://github.com/ExploitCraft/ReconNinja.git#branch=main")
sha256sums=('fe1220deb8b18ec70c500f48bd76f05f2315b5e94e06b617b510f5d418d52701')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
