# Maintainer: lucas007 <lucaszhou007@163.com>
pkgname=amdgpu-fan-ctl-tyan-s8030gm2ne
pkgver=1.0.1
pkgrel=1
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
b2sums=('90eaf0eea7506e92d5d3af86b81e38458818f1544187d4aa7b47aba7a9af24b8aa698b704b97a96eae5b1bb0d3f2177b4d944da0eefebdd3f2c8fe1bf144d3c6'
        '19753b1405f8f648deef94f0d0bf28315030a1d41b8a84ab077df411ed01c53d23801f8bf4e98b5a481f562b22626073e28706fc0e128b4764c94bb5cd41bf74'
        '889764dbb9d8695aef03058750af2cd2c6efc0bac7fd6b0aabd9ef814802207bf23aff337f5e55439ddb474530d8fc9fcda4961c2431ea437785445c4b8376b8'
        '7f44c8f84dd1bbb5b8e8181d9b949d2f679bdda68c9eacfce2384efc1f0450eb32cd456f49d707879f3cc6d11ea99157bf28912bafcd883b6b24a3c2f01ba95d'
        '5dd66b701403831cfa4842528f53c410aac60cd66dc77df2ec6fae7335bb6d2531c6bcafebb997e16caca6a1131799d13e601876b72af452f508fe9593cb239c'
        'c9dc482d2d73ce29e520ef7cca87b0a491624852d8b1d026fe12ac16c913988bbb70f395a46ea34fa3cd67ed0f19abf1da4d4f2553e8e006be74ac3a4963ef86'
        '8bc47db5fef22117d2db19779e1daecd1c0997f066c8549c9417099e5e136499f63abf7908f1f1464210a9f0ca4f72e8a1267a2b8ef6807060b8fb74dc8b87e2'
        '71b8d980a5506638f6836b97b1252377ccfbc9def2dc49062e9955aaea938c5144eab8d99dd7955f90dd3e3a2db7ad8122dcdd6c8b29652ac448989caa9f9098')

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
