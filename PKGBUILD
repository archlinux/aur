# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.20
pkgrel=1
pkgdesc="Advanced Package Manager & Environment Orchestrator (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/zillowe/zillwen/zusty/zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('git' 'gnupg')
optdepends=(
  'bash-completion: for bash shell completion'
  'zsh: for zsh shell completion'
  'fish: for fish shell completion'
  'bubblewrap: for running contained apps'
)
_downloads="$url/-/releases/Prod-Release-$pkgver/downloads"

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$_downloads/${pkgname%-bin}-linux-amd64.tar.zst"
  "LICENSE::$_downloads/LICENSE"
  "zoi.1::$_downloads/zoi.1"
  "zoi-rs.3::$_downloads/zoi-rs.3"
  "zoi-lua.5::$_downloads/zoi-lua.5")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$_downloads/${pkgname%-bin}-linux-arm64.tar.zst"
  "LICENSE::$_downloads/LICENSE"
  "zoi.1::$_downloads/zoi.1"
  "zoi-rs.3::$_downloads/zoi-rs.3"
  "zoi-lua.5::$_downloads/zoi-lua.5")

sha512sums_x86_64=('43c674a494d39b3a0217c934c696cf5191ad8e42a547d6aa6f741242285fddd940eefb285a5212b87bf7aaf8b0fa50982a85219437c264784f660933bfb489cd'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'c105d89db440ea9ff7593eac3f21c558383bfb84c04c7e7933a722e7dd0f1cd4b040b81e24b5263568c50577ae9bf4293aa07837f3ef74e2b3747d2d1ed714b2'
  '4f2039e025c53a0568728010bb32e0ce09be81e756cd61f85a4ba62d8159e78fcce4befdc6a1d83bea338d2a3e42e4759cbd63c9414c9645309d7a7c1799416d'
  'f428608504605ef2cd863ad0ecdabdb840d788fadfac1c228a17b80f893d3f163f61be6c0f420b0620c3f7d401a981e13ae5515f4d1ede7a34cd0c95b022ab91')
sha512sums_aarch64=('22011fe8ed440eea9c7993e51fc9636a5edd2e5feea1596e5fa86803a9171cb488c20893882b886b6f2af7dc3dda7811e3f23ee81d13af1712064f5bd0d1e1ec'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'c105d89db440ea9ff7593eac3f21c558383bfb84c04c7e7933a722e7dd0f1cd4b040b81e24b5263568c50577ae9bf4293aa07837f3ef74e2b3747d2d1ed714b2'
  '4f2039e025c53a0568728010bb32e0ce09be81e756cd61f85a4ba62d8159e78fcce4befdc6a1d83bea338d2a3e42e4759cbd63c9414c9645309d7a7c1799416d'
  'f428608504605ef2cd863ad0ecdabdb840d788fadfac1c228a17b80f893d3f163f61be6c0f420b0620c3f7d401a981e13ae5515f4d1ede7a34cd0c95b022ab91')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions bash >"$_bash_completion_dir/${pkgname%-bin}"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions zsh >"$_zsh_completion_dir/_${pkgname%-bin}"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions fish >"$_fish_completion_dir/${pkgname%-bin}.fish"

  install -Dm644 "${srcdir}/zoi.1" "$pkgdir/usr/share/man/man1/zoi.1"
  install -Dm644 "${srcdir}/zoi-rs.3" "$pkgdir/usr/share/man/man3/zoi-rs.3"
  install -Dm644 "${srcdir}/zoi-lua.5" "$pkgdir/usr/share/man/man5/zoi-lua.5"
}
