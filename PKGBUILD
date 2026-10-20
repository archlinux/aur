# Maintainer: lucas007 <lucas007@localhost>
pkgname=amdgpu-fan-ctl-tyan-s8030gm2ne
pkgver=1.0.0
pkgrel=2
pkgdesc="AMD GPU temperature driven fan control for Tyan S8030GM2NE via local ipmitool"
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('python' 'ipmitool' 'rocm-smi-lib')
backup=('etc/gpu-fan-ctl/config.toml')
source=(
  "gpu_fan_ctl.py"
  "config.toml"
  "$pkgname.service"
  "$pkgname.conf"
  "90-$pkgname.rules"
  "LICENSE-MIT"
  "README.md"
  "test_gpu_fan_ctl.py"
)
b2sums=(
  'e5a09a72c4a76e9afb0798c932956f58bc5436fe0c5013dd24007fc668e105056191a11dfe3d4ffb891b305dcc4f009d0f4a9fae0114d3590d70a0648b7fc4f2'
  '70d53d7faafa4710cdd52f80d95e71d75b2ba7635bb24b4d0f1e2b38dcb5cf8238ed30d28337ee07ca9c40492253cfa2d07022d8f8a6121d3de50aa2034d5e7d'
  '73ef4542daebed5737ad540435b94204294a828699f8eb2be87dd28ba2c67bd464aa1075ce4680d6416d60ec3353a100c2a18b7d869b989405f2e710007375e2'
  '8b8fa05507ca8fb4c3af3392a917b8d26700dbf0be1fc591d903a422a193a074628b1228aea7f95b6855391de3f5d9e6c2263142a3c4bbfb5e2d14233213410b'
  '5dd66b701403831cfa4842528f53c410aac60cd66dc77df2ec6fae7335bb6d2531c6bcafebb997e16caca6a1131799d13e601876b72af452f508fe9593cb239c'
  'c9dc482d2d73ce29e520ef7cca87b0a491624852d8b1d026fe12ac16c913988bbb70f395a46ea34fa3cd67ed0f19abf1da4d4f2553e8e006be74ac3a4963ef86'
  '4a2028c181985e062f7a1f5ffbf23ee5eef0d033d4ec99a99dcaa791a2b8847ade18a970ab926ee9c91308d0cb4b0395857034aff9108637187b97ea94708b5c'
  '55fd98f845a7f4eea4fd2f9c487625cd434519ad1bd50976a85e9f4d70786a84602188faf9168a1858767c0b6bb890c2d4722c59f29a3ae3870ab026d35a8ded'
)

check() {
  cd "$srcdir"
  python3 -m unittest -q test_gpu_fan_ctl
}

package() {
  install -Dm755 "$srcdir/gpu_fan_ctl.py" "$pkgdir/usr/lib/$pkgname/gpu_fan_ctl.py"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/gpu-fan-ctl/config.toml"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.conf" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/90-$pkgname.rules" \
    "$pkgdir/usr/lib/udev/rules.d/90-$pkgname.rules"
  install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/test_gpu_fan_ctl.py" \
    "$pkgdir/usr/share/doc/$pkgname/test_gpu_fan_ctl.py"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/gpu_fan_ctl.py" "$pkgdir/usr/bin/gpu-fan-ctl"
}
