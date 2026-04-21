# Maintainer: dougefresh <dchimento@gmail.com>
pkgver=0.68.0.r7.ga0a16c776
pkgrel=1
pkgdesc="Coding agent CLI with read, bash, edit, write tools and session management"
url="https://github.com/badlogic/pi-mono"
pkgbase=pi-coding-agent-git
pkgname=('pi-coding-agent-git'
    'pi-ext-todo-git'
    'pi-ext-git-checkpoint-git'
    'pi-ext-plan-mode-git'
    'pi-ext-auto-commit-git'
    'pi-ext-notify-git'
    'pi-ext-confirm-destructive-git'
    'pi-ext-protected-paths-git'
    'pi-ext-subagent-git'
    'pi-ext-session-name-git'
    'pi-ext-claude-rules-git'
    'pi-ext-send-user-message-git'
    'pi-ext-bookmark-git'
    'pi-ext-titlebar-spinner-git'
    'pi-ext-bash-spawn-hook-git'
)
_pkgname=pi-coding-agent
arch=('x86_64')
license=('MIT')
makedepends=('git' 'npm' 'typescript-go-git')
source=(
    "${_pkgname}::git+https://github.com/badlogic/pi-mono"
    'pi-wrapper'
    'APPEND_SYSTEM.md.example'
)
sha256sums=('SKIP' '7883f9bdeeec04f9e06584ac4b4d55c813377f924623b8dd3b58b1465ab82fa6' 'SKIP')
options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build_pi-coding-agent-git() {
    cd "$srcdir/$_pkgname"
    npm ci --no-audit --no-fund
    npm run build
    npm prune --omit=dev --no-audit --no-fund
}

package_pi-coding-agent-git() {
    depends=('nodejs')
    conflicts=('pi-coding-agent')
    provides=('pi-coding-agent')
    install=pi-coding-agent-git.install

    # wrapper script
    install -Dm755 "$srcdir/pi-wrapper" "$pkgdir/usr/bin/pi"

    # install monorepo to /usr/lib/node_modules/pi-coding-agent
    cd "$srcdir/$_pkgname"
    local _destdir="$pkgdir/usr/lib/node_modules/$_pkgname"
    mkdir -p "$_destdir"
    cp -a package.json node_modules packages "$_destdir/"

    # docs
    install -Dm644 packages/coding-agent/README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$srcdir/APPEND_SYSTEM.md.example" "$pkgdir/usr/share/doc/$_pkgname/APPEND_SYSTEM.md.example"
}

package_pi-ext-todo-git() {
    pkgdesc="Todo list extension"
    conflicts=('pi-ext-todo')
    provides=('pi-ext-todo')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/todo.ts "$pkgdir/usr/share/pi/extensions/todo.ts"
}

package_pi-ext-git-checkpoint-git() {
    pkgdesc="Git checkpoint extension"
    conflicts=('pi-ext-git-checkpoint')
    provides=('pi-ext-git-checkpoint')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/git-checkpoint.ts "$pkgdir/usr/share/pi/extensions/git-checkpoint.ts"
}

package_pi-ext-plan-mode-git() {
    pkgdesc="Plan mode extension"
    conflicts=('pi-ext-plan-mode')
    provides=('pi-ext-plan-mode')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/plan-mode "$pkgdir/usr/share/pi/extensions/plan-mode"
}

package_pi-ext-auto-commit-git() {
    pkgdesc="Auto commit on exit extension"
    conflicts=('pi-ext-auto-commit')
    provides=('pi-ext-auto-commit')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/auto-commit-on-exit.ts "$pkgdir/usr/share/pi/extensions/auto-commit-on-exit.ts"
}

package_pi-ext-notify-git() {
    pkgdesc="Notification extension"
    conflicts=('pi-ext-notify')
    provides=('pi-ext-notify')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/notify.ts "$pkgdir/usr/share/pi/extensions/notify.ts"
}

package_pi-ext-confirm-destructive-git() {
    pkgdesc="Confirm destructive operations"
    conflicts=('pi-ext-confirm-destructive')
    provides=('pi-ext-confirm-destructive')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/confirm-destructive.ts "$pkgdir/usr/share/pi/extensions/confirm-destructive.ts"
}

package_pi-ext-protected-paths-git() {
    pkgdesc="PI Protected paths extension"
    conflicts=('pi-ext-protected-paths')
    provides=('pi-ext-protected-paths')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/protected-paths.ts "$pkgdir/usr/share/pi/extensions/protected-paths.ts"
}

package_pi-ext-subagent-git() {
    pkgdesc="PI Subagent extension"
    conflicts=('pi-ext-subagent')
    provides=('pi-ext-subagent')
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/subagent "$pkgdir/usr/share/pi/extensions/subagent"
}

package_pi-ext-session-name-git() {
    _extname="session-name"
    pkgdesc="PI Extension session name"
    conflicts=("pi-ext-session-name")
    provides=("pi-ext-session-name")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-bookmark-git() {
    _extname="bookmark"
    pkgdesc="PI Extension bookmark"
    conflicts=("pi-ext-bookmark")
    provides=("pi-ext-bookmark")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extame}.ts"
}

package_pi-ext-claude-rules-git() {
    _extname="claude-rules"
    pkgdesc="PI Extension claude-rules"
    conflicts=("pi-ext-claude-rules")
    provides=("pi-ext-claude-rules")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-send-user-message-git() {
    _extname="send-user-message"
    pkgdesc="PI Extension ${_pkgname}"
    conflicts=("pi-ext-send-user-message")
    provides=("pi-ext-send-user-message")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}

package_pi-ext-titlebar-spinner-git() {
    _extname="titlebar-spinner"
    pkgdesc="PI Extension ${_extname}"
    conflicts=("pi-ext-${_extname}")
    provides=("pi-ext-${_extname}")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}


package_pi-ext-bash-spawn-hook-git() {
    _extname="bash-spawn-hook"
    pkgdesc="PI Extension bash spawn hook"
    conflicts=("pi-ext-bash-spawn-hook")
    provides=("pi-ext-bash-spawn-hook")
    install=pi-ext-git.install

    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/${_extname}.ts "$pkgdir/usr/share/pi/extensions/${_extname}.ts"
}


build_pi-ext-sandbox-git() {
    cd "$srcdir/$_pkgname/packages/coding-agent/examples/extensions/sandbox"
    npm ci --no-audit --no-fund
}

package_pi-ext-sandbox-git() {
    conflicts=('pi-ext-sandbox')
    install=pi-ext-git.install
    pkgdesc="PI sanbox extension"
    provides=('pi-ext-sandbox')

    mkdir -p "$pkgdir/usr/share/pi/extensions"
    cp -a packages/coding-agent/examples/extensions/sandbox "$pkgdir/usr/share/pi/extensions/sandbox"
}
