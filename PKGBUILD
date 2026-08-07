# Maintainer: trektn <trekt at poopf dot art>

pkgname=python-anitomy-ng-bin
_pkgname=anitomy_ng
pkgver=1.0.9
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
_whl_x86_64=anitomy_ng-${pkgver}-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
_whl_aarch64=anitomy_ng-${pkgver}-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

source_x86_64=("https://files.pythonhosted.org/packages/ac/2d/ff1bddbc9a5f31efa134582bafb65f889fad63c2e85a04a9d69fb0d26926/${_whl_x86_64}")
sha256sums_x86_64=('fc9cf211880aebf44c8298df44c48301b3e276317c265f14d053ee83a68fab81')

source_aarch64=("https://files.pythonhosted.org/packages/a3/50/5a542e769b08dfa1f14725a90d929016b447be947fff395e54a222cab9c7/${_whl_aarch64}")
sha256sums_aarch64=('8a5b18d80966e1325e38e0b71aaef5e1449b76e0128e9cc0290d77a0057349b1')

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
