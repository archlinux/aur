# Maintainer: lipeilin2006 <2953079330@qq.com>

# 软件包基本信息
pkgname="rdbcli-bin"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Relational database command-line tools."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/lipeilin2006/rdbcli"
license=("MIT")
depends=("icu")
makedepends=()
optdepends=()
provides=("rdbcli=${pkgver}")
conflicts=("rdbcli" "rdbcli-git")
replaces=("rdbcli")
options=(!strip)

if [[ "${CARCH}" == "x86_64" ]]; then
  runtime_identifier="x64"
  sha256sums=("857dcfa17855ea8fae1c8042fec13daa89281e9f31965abe6d812071c0686ed6")
elif [[ "${CARCH}" == "aarch64" ]]; then
  runtime_identifier="arm64"
  sha256sums=("06dc5da61feb08ddf0e5321cc0edd9e5327185012363b38902761f6f1c7d89fe")
elif [[ "${CARCH}" == "armv7h" ]]; then
  runtime_identifier="arm"
  sha256sums=("0fb330e2ffa6c91011ffcaaf055eff61f82e9b869e926f0bf63a5a2d32cc75ad")
fi

gzip_filename="rdbcli-${pkgver}-linux-${runtime_identifier}.tar.gz"

source=("${url}/releases/download/${pkgver}/${gzip_filename}")

prepare() {
  :
}

build() {
  :
}

package() {
  local extract_dir="${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${extract_dir}"
  tar -zxf "${srcdir}/${gzip_filename}" -C "${extract_dir}"

  install -Dm755 "${extract_dir}/rdbcli" "${pkgdir}/usr/bin/rdbcli"
  install -Dm644 "${extract_dir}/completions/rdbcli-completion.sh" "${pkgdir}/etc/profile.d/rdbcli-completion.sh"
  install -Dm644 "${extract_dir}/completions/rdbcli-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/rdbcli"
  install -Dm644 "${extract_dir}/completions/rdbcli-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_rdbcli"
  install -Dm644 "${extract_dir}/completions/rdbcli-completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/rdbcli.fish"
  install -Dm644 "${extract_dir}/completions/rdbcli-completion.tcsh" "${pkgdir}/usr/share/tcsh/completions/rdbcli.tcsh"
  install -Dm644 "${extract_dir}/LICENSE" "${pkgdir}/usr/share/licenses/rdbcli/LICENSE"
}
