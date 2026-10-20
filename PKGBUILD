# Maintainer: lucas007 <lucaszhou007@163.com>
pkgname=amdgpu-fan-ctl-tyan-s8030gm2ne
pkgver=1.0.0
pkgrel=3
pkgdesc="AMD GPU temperature driven fan control for Tyan S8030GM2NE via local ipmitool"
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('python' 'ipmitool' 'rocm-smi-lib')
backup=('etc/amdgpu-fan-ctl/config.toml')
source=(
  "amdgpu_fan_ctl.py"
  "config.toml"
  "amdgpu-fan-ctl.service"
  "amdgpu-fan-ctl.conf"
  "90-amdgpu-fan-ctl.rules"
  "LICENSE-MIT"
  "README.md"
  "test_amdgpu_fan_ctl.py"
)
b2sums=(
  '5e4a184ad18cc9695c5a0fec92be6f163a66b49514c7b1c043c4d7eace5f5a6d3a1a3dc5e553ce7e49026bd2f7fc7c124a6b2d4bc58614813edd4acfd5aee653'
  'aee76a07a59cb5b79abe58fd9c2fd15b4bef5e1c13ef73186dfd4b655f5945c2f0fd8de9615c85dfb21c0ab5e206c8ee59cc133fc1ebf66c495989b492f4dbf6'
  '889764dbb9d8695aef03058750af2cd2c6efc0bac7fd6b0aabd9ef814802207bf23aff337f5e55439ddb474530d8fc9fcda4961c2431ea437785445c4b8376b8'
  '7f44c8f84dd1bbb5b8e8181d9b949d2f679bdda68c9eacfce2384efc1f0450eb32cd456f49d707879f3cc6d11ea99157bf28912bafcd883b6b24a3c2f01ba95d'
  '5dd66b701403831cfa4842528f53c410aac60cd66dc77df2ec6fae7335bb6d2531c6bcafebb997e16caca6a1131799d13e601876b72af452f508fe9593cb239c'
  'c9dc482d2d73ce29e520ef7cca87b0a491624852d8b1d026fe12ac16c913988bbb70f395a46ea34fa3cd67ed0f19abf1da4d4f2553e8e006be74ac3a4963ef86'
  '175ef088a604080d946225d63109524228c1a39fb107035eb627a91575f1ada1e1bf483aff5fbe2e090a07681c7fe2daa76cc33024d7306553b29a6d8e740190'
  '6b8cc65c62a56fb3aed305c7c88c46e1d1573e2b826fec0206c0771d9bd17b4d3902f3d5a05bf4af73a3b05fe669a26236426042071fd67ef19109dd51af38b8'
)

check() {
  cd "$srcdir"
  python3 -m unittest -q test_amdgpu_fan_ctl
}

package() {
  install -Dm755 "$srcdir/amdgpu_fan_ctl.py" \
    "$pkgdir/usr/lib/amdgpu-fan-ctl/amdgpu_fan_ctl.py"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/amdgpu-fan-ctl/config.toml"
  install -Dm644 "$srcdir/amdgpu-fan-ctl.service" \
    "$pkgdir/usr/lib/systemd/system/amdgpu-fan-ctl.service"
  install -Dm644 "$srcdir/amdgpu-fan-ctl.conf" \
    "$pkgdir/usr/lib/sysusers.d/amdgpu-fan-ctl.conf"
  install -Dm644 "$srcdir/90-amdgpu-fan-ctl.rules" \
    "$pkgdir/usr/lib/udev/rules.d/90-amdgpu-fan-ctl.rules"
  install -Dm644 "$srcdir/LICENSE-MIT" \
    "$pkgdir/usr/share/licenses/amdgpu-fan-ctl/LICENSE"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/amdgpu-fan-ctl/README.md"
  install -Dm644 "$srcdir/test_amdgpu_fan_ctl.py" \
    "$pkgdir/usr/share/doc/amdgpu-fan-ctl/test_amdgpu_fan_ctl.py"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/amdgpu-fan-ctl/amdgpu_fan_ctl.py" "$pkgdir/usr/bin/amdgpu-fan-ctl"
}
