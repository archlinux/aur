# Maintainer: Majd Bnat <magame2tec@gmail.com>
pkgname=aegis-pentest
pkgver=0.11.0
pkgrel=1
pkgdesc="AI-driven web penetration testing orchestrator (PTES + OWASP WSTG)"
arch=('any')
url="https://github.com/glorybnat/aegis-pentest"
license=('MIT')
depends=(
  'python>=3.12'
  'python-pip'
  'python-typer'
  'python-rich'
  'python-httpx'
  'python-pydantic'
  'python-sqlmodel'
  'python-structlog'
  'python-jinja'
  'python-anyio'
  'python-yaml'
  'python-dnspython'
  'python-dateutil'
  'python-aiosqlite'
  'python-packaging'
)
optdepends=(
  'nmap: port scanning'
  'nuclei: vulnerability scanning (go install)'
  'subfinder: subdomain enumeration (go install)'
  'httpx: HTTP probing (go install)'
  'ffuf: content discovery (AUR: ffuf)'
  'gobuster: content discovery (AUR: gobuster)'
  'whatweb: web fingerprinting (BlackArch)'
  'wpscan: WordPress scanning (AUR: wpscan)'
  'testssl.sh: TLS analysis (AUR: testssl.sh)'
  'sqlmap: SQL injection testing (BlackArch)'
  'nikto: web server scanner (BlackArch)'
  'katana: web crawler (go install)'
  'amass: OSINT subdomain enum (AUR: amass)'
  'gitleaks: secret scanning (go install)'
  'trufflehog: secret scanning (go install)'
  'gowitness: screenshot tool (go install)'
  'sslscan: SSL/TLS scanner'
  'arjun: HTTP parameter discovery (pipx)'
  'droopescan: Drupal scanner (pipx)'
  'wappalyzer-cli: tech detection (npm)'
  'impacket: Active Directory tooling (pipx)'
  'kerbrute: AD pre-auth user enum (go install)'
  'bloodhound-python: AD path collector (pipx)'
  'certipy: AD CS ESC1..ESC11 enum (pipx)'
  'scoutsuite: multi-cloud config audit (pipx)'
  'cloudsplaining: AWS IAM analysis (pipx)'
  'kube-bench: CIS Kubernetes Benchmark'
  'kube-hunter: K8s vulnerability scan (pipx)'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('127e09b7476ac80f229330aeb5a30993658bd1d09e5c8869b899baf9c8fd724a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  if [ -f completions/aegis.bash ]; then
    install -Dm644 completions/aegis.bash \
      "$pkgdir/usr/share/bash-completion/completions/aegis"
  fi
  if [ -f completions/_aegis ]; then
    install -Dm644 completions/_aegis \
      "$pkgdir/usr/share/zsh/site-functions/_aegis"
  fi
}
