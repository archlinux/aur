# Maintainer: trektn <trekt at poopf dot art>

pkgname=python-anitomy-ng-bin
_pkgname=anitomy_ng
pkgver=1.0.7
pkgrel=1
pkgdesc="Anime video filename parser (pure-Rust port of Anitomy, pyo3 bindings)"
arch=('x86_64' 'aarch64')
url="https://github.com/tylergibbs2/anitomy-ng"
license=('MPL2')
depends=('python')
provides=('python-anitomy-ng')
conflicts=('python-anitomy-ng')
options=('!strip')

# Kept at their original PyPI filenames (not renamed via the source::name
# syntax) -- `python -m installer` parses the wheel filename itself
# (PEP 427 tags) and rejects anything that isn't a valid one.
_whl_x86_64=anitomy_ng-1.0.7-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
_whl_aarch64=anitomy_ng-1.0.7-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

source_x86_64=("https://files.pythonhosted.org/packages/e7/05/92a19408067edde2469cea74d7363867690d10a48ce2524c2f4d1b861226/${_whl_x86_64}")
sha256sums_x86_64=('e529df5594c15458bdd062c6a3f88792442b0e057eba07b6206b773276f60f67')

source_aarch64=("https://files.pythonhosted.org/packages/cb/d0/868eb325c1012f3cb03765ff1659f1ba963628dabc951dcf9bf5f6218c71/${_whl_aarch64}")
sha256sums_aarch64=('a69b6affdd24dfa82a5ae60f700494493dc710e2a3f5767591115e4d6c37b63a')

# noextract can't be arch-specific; list both possible filenames -- only
# the one matching the build's CARCH actually exists in $srcdir.
noextract=("$_whl_x86_64" "$_whl_aarch64")

# No build() -- this repackages the official prebuilt wheel from PyPI
# rather than compiling anything (the upstream Rust crate has no
# source-only build path via pip without a full Rust+maturin toolchain).

package() {
  # python -m installer installs the wheel's own dist-info (including
  # dist-info/licenses/LICENSE) into site-packages -- no separate
  # extraction or /usr/share/licenses step needed.
  local whl_var="_whl_${CARCH}"
  python -m installer --destdir="$pkgdir" "${!whl_var}"
}
