# Maintainer: lzsnyy <710080675@qq.com>

# Prebuilt repack of the official Linux distribution of MiniMax Code (the npm
# package @minimax-ai/code). No npm install and no node-gyp run at build time:
# every JavaScript tarball and the platform native addon are pinned as
# sources with checksums. The node-v147 better-sqlite3 prebuild matches the
# ABI of Arch's nodejs (26.x, modules 147).

pkgname=minimax-code-bin
_pkgname='@minimax-ai/code'
pkgver=0.7.7
pkgrel=1
# upstream optionalDependencies pin
_better_sqlite3_ver=12.11.1
pkgdesc='MiniMax Code terminal AI coding agent (mcode CLI, prebuilt)'
arch=('x86_64')
url='https://agent.minimax.cn/download'
license=('MIT')
depends=(
  'nodejs>=26'
  'gcc-libs'
  'glibc'
  'libx11'
  'libxi'
  'libxkbcommon'
)
optdepends=('git: version control features')
provides=("minimax-code=${pkgver}")
conflicts=('minimax-code')
options=('!strip')
source=('LICENSE')
sha256sums=('9d8b53a4e5afaa1b1cae3e7e5048952cd09050722951cab6638163500e0b3579')
source_x86_64=(
  "code-${pkgver}.tgz::https://registry.npmjs.org/@minimax-ai/code/-/code-${pkgver}.tgz"
  'ripgrep-1.18.0.tgz::https://registry.npmjs.org/@vscode/ripgrep/-/ripgrep-1.18.0.tgz'
  'ripgrep-linux-x64-1.18.0.tgz::https://registry.npmjs.org/@vscode/ripgrep-linux-x64/-/ripgrep-linux-x64-1.18.0.tgz'
  'clipboard-0.3.9.tgz::https://registry.npmjs.org/@mariozechner/clipboard/-/clipboard-0.3.9.tgz'
  'clipboard-linux-x64-gnu-0.3.9.tgz::https://registry.npmjs.org/@mariozechner/clipboard-linux-x64-gnu/-/clipboard-linux-x64-gnu-0.3.9.tgz'
  'cua-driver-0.34.1.tgz::https://registry.npmjs.org/@trycua/cua-driver/-/cua-driver-0.34.1.tgz'
  'cua-driver-linux-x64-gnu-0.34.1.tgz::https://registry.npmjs.org/@trycua/cua-driver-linux-x64-gnu/-/cua-driver-linux-x64-gnu-0.34.1.tgz'
  'ubjs-core-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/core/-/core-0.31.0-3.tgz'
  'ubjs-node-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/node/-/node-0.31.0-3.tgz'
  'ubjs-node-linux-x64-gnu-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/node-linux-x64-gnu/-/node-linux-x64-gnu-0.31.0-3.tgz'
  "better-sqlite3-${_better_sqlite3_ver}.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_better_sqlite3_ver}.tgz"
  'bindings-1.5.0.tgz::https://registry.npmjs.org/bindings/-/bindings-1.5.0.tgz'
  'file-uri-to-path-1.0.0.tgz::https://registry.npmjs.org/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz'
  "better-sqlite3-node-${_better_sqlite3_ver}-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v${_better_sqlite3_ver}/better-sqlite3-v${_better_sqlite3_ver}-node-v147-linux-x64.tar.gz"
)
sha256sums_x86_64=(
  '0f23ff98b53bb4100a151331b048c81bf8ba4849efde2324e925945e8f40f6c0'
  '6d12c8978be61caa15721b226583b52d1a0397a3a1745296f7c7cfa387249069'
  '8cc06e25e29f9c258ee9a09eecd7707c1ea2e99d9e76151e53dbe39f8d6b4a09'
  '25986ebeecaffadf3d1dd5f9199869057e4b64c37d7069c7f31c231dd86b5639'
  '106b4f4a9218991056912937dfc6b7a2311d5ddf360c9692a765559656beb05e'
  '5f867773b5eb3658df1e39a5675edcba60fd22dd061b99cb3a9523cc99018a3b'
  '45a2df04cccab5567483d557a14c655cb8c4e31305de6159bf05fd070ddcea00'
  '74d7950698bdc74569a8e754b2d5dc055a43afdd0647c0171595f9b77e8c7151'
  'e5c18f3cfc46d072f9aa23439644c9c18fac62729e6385aadcc937e458507a09'
  '08e05d837c6b3faefdd3e77ac3155c2654392a62d241961bcccc221f3783170a'
  'ebf0ed75a7a59dbcb3b24bbd014ef49d9f15bc328e4adcbf516f2a8fadfa2835'
  'd77781178c5bd89a91b1f6c5556acd511b1b5927eb13e2ad8189cac29eeb0907'
  '5440cdf67e75ab96f36a6be63c1d4c3d54255b1d0970273710fecfebfab06fb3'
  'a90711eae785b646d6799b31cf8dd79a5d750b1af72d310472c3b996c5cee92d'
)

_prepare_npm() {
  local _tgz="$1" _dest="$2"
  install -dm755 "${_dest}"
  tar -xzf "${srcdir}/${_tgz}" -C "${_dest}" --strip-components=1
}

prepare() {
  local _nm="${srcdir}/node_modules"
  rm -rf "${_nm}"
  install -dm755 "${_nm}/@minimax-ai" "${_nm}/@vscode" \
    "${_nm}/@mariozechner" "${_nm}/@trycua" "${_nm}/@ubjs"

  _prepare_npm "code-${pkgver}.tgz" "${_nm}/${_pkgname}"
  _prepare_npm 'ripgrep-1.18.0.tgz' "${_nm}/@vscode/ripgrep"
  _prepare_npm 'ripgrep-linux-x64-1.18.0.tgz' "${_nm}/@vscode/ripgrep-linux-x64"
  _prepare_npm 'clipboard-0.3.9.tgz' "${_nm}/@mariozechner/clipboard"
  _prepare_npm 'clipboard-linux-x64-gnu-0.3.9.tgz' "${_nm}/@mariozechner/clipboard-linux-x64-gnu"
  _prepare_npm 'cua-driver-0.34.1.tgz' "${_nm}/@trycua/cua-driver"
  _prepare_npm 'cua-driver-linux-x64-gnu-0.34.1.tgz' "${_nm}/@trycua/cua-driver-linux-x64-gnu"
  _prepare_npm 'ubjs-core-0.31.0-3.tgz' "${_nm}/@ubjs/core"
  _prepare_npm 'ubjs-node-0.31.0-3.tgz' "${_nm}/@ubjs/node"
  _prepare_npm 'ubjs-node-linux-x64-gnu-0.31.0-3.tgz' "${_nm}/@ubjs/node-linux-x64-gnu"
  _prepare_npm "better-sqlite3-${_better_sqlite3_ver}.tgz" "${_nm}/better-sqlite3"
  _prepare_npm 'bindings-1.5.0.tgz' "${_nm}/bindings"
  _prepare_npm 'file-uri-to-path-1.0.0.tgz' "${_nm}/file-uri-to-path"

  # The npm tarball ships only sources; drop the node-v147 prebuilt binding in
  # place so bindings resolves build/Release/better_sqlite3.node.
  tar -xzf "${srcdir}/better-sqlite3-node-${_better_sqlite3_ver}-linux-x64.tar.gz" \
    -C "${_nm}/better-sqlite3"
  rm -rf "${_nm}/better-sqlite3/deps" "${_nm}/better-sqlite3/src" \
    "${_nm}/better-sqlite3/binding.gyp"

  # Non-Linux platform payloads are dead weight on this package's only arch.
  rm -rf "${_nm}/${_pkgname}/native/darwin" \
    "${_nm}/${_pkgname}/native/win32" \
    "${_nm}/${_pkgname}/embedded/computer-use/0.34.1/win32-x64" \
    "${_nm}/${_pkgname}/embedded/computer-use/0.34.1/win32-arm64" \
    "${_nm}/${_pkgname}/embedded/computer-use/0.34.1/darwin-x64" \
    "${_nm}/${_pkgname}/embedded/computer-use/0.34.1/darwin-arm64"
  # mcode-tools' manifest.json enumerates its win32 registry.node files;
  # removing them makes the manifest integrity check fail, so keep them.
  rm -f "${_nm}/${_pkgname}/internal-bin/mcode-tools.cmd"
  chmod 755 "${_nm}/${_pkgname}/internal-bin/mcode-tools"
}

package() {
  local _root="${pkgdir}/opt/${pkgname}"

  install -dm755 "${_root}"
  cp -a "${srcdir}/node_modules" "${_root}/node_modules"

  find "${_root}" -type d -exec chmod 755 '{}' +
  find "${_root}" -type f -perm /111 -exec chmod 755 '{}' +
  find "${_root}" -type f ! -perm /111 -exec chmod 644 '{}' +

  # Both launchers pin the system Node: the bundled binding is built for its ABI.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcode" <<'SCRIPT'
#!/bin/sh
exec /usr/bin/node /opt/minimax-code-bin/node_modules/@minimax-ai/code/cli.js "$@"
SCRIPT
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcode-tools" <<'SCRIPT'
#!/bin/sh
exec /usr/bin/node /opt/minimax-code-bin/node_modules/@minimax-ai/code/mcode-tools.js "$@"
SCRIPT

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
